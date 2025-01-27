const express = require('express');
const { createClient } = require('@supabase/supabase-js');
const router = express.Router();

// Initialize Supabase client
const supabase = createClient(
    process.env.SUPABASE_URL,
    process.env.SUPABASE_KEY
);

// Create new user
router.post('/new-user', async (req, res) => {
    try {
        const { authUserId, fullName, username, phoneNumber, addresses } = req.body;

        if (!authUserId || !fullName || !username) {
            return res.status(400).json({ error: 'Missing required fields' });
        }

        const { data, error } = await supabase
            .from('users')
            .insert([{
                auth_user_id: authUserId,
                full_name: fullName,
                username,
                phone_number: phoneNumber,
                addresses
            }])
            .single();

        if (error) throw error;
        res.status(201).json(data);

    } catch (error) {
        console.error('Error creating user:', error);
        res.status(500).json({ error: error.message });
    }
});

// Get user by authUserId
router.get('/users/:id', async (req, res) => {
    try {
        const { data, error } = await supabase
            .from('users')
            .select('*')
            .eq('auth_user_id', req.params.id)
            .single();

        if (error) throw error;
        if (!data) {
            return res.status(404).json({ error: 'User not found' });
        }

        res.json(data);

    } catch (error) {
        console.error('Error fetching user:', error);
        res.status(500).json({ error: error.message });
    }
});

module.exports = router;
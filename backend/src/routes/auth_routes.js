const express = require("express");
const { createClient } = require("@supabase/supabase-js");

const router = express.Router();

// Supabase client
const supabase = createClient(process.env.SUPABASE_URL, process.env.SUPABASE_KEY);

// Signup route
router.post("/signup", async (req, res) => {
    const { email, password } = req.body;

    try {
        const { user, error } = await supabase.auth.signUp({ email, password });

        if (error) throw error;
        res.status(201).json({ message: "User signed up successfully!", user });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

// Login route
router.post("/login", async (req, res) => {
    const { email, password } = req.body;

    try {
        const { data, error } = await supabase.auth.signInWithPassword({ email, password });

        if (error) throw error;
        res.status(200).json({ message: "User logged in successfully!", data });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

module.exports = router;

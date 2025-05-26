const express = require('express');
const multer = require('multer');
const path = require('path');
const Post = require('../models/Post');
const router = express.Router();

// Multer configuration for image upload
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'uploads/');
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + path.extname(file.originalname));
  },
});
const upload = multer({ storage });

// Upload post with image
router.post('/', upload.single('image'), async (req, res) => {
  const { name, description } = req.body;
  const imageUrl = `/uploads/${req.file.filename}`;

  try {
    const post = new Post({ name, description, imageUrl });
    await post.save();
    res.status(201).json({ message: 'Post uploaded successfully', post });
  } catch (error) {
    res.status(500).json({ message: 'Server error' });
  }
});

module.exports = router;
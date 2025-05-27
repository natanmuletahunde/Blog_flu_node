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
  if (!req.file) {
    console.log('No file uploaded');
    return res.status(400).json({ message: 'No file uploaded' });
  }

  const { name, description } = req.body;
  if (!name || !description) {
    console.log('Missing name or description');
    return res.status(400).json({ message: 'Name and description are required' });
  }

  const imageUrl = `/uploads/${req.file.filename}`;
  console.log('File uploaded:', req.file.filename);

  try {
    const post = new Post({ name, description, imageUrl });
    await post.save();
    res.status(201).json({ message: 'Post uploaded successfully', post });
  } catch (error) {
    console.error('Error saving post:', error);
    res.status(500).json({ message: 'Server error' });
  }
});

module.exports = router;
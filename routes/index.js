const multer = require('multer')
const { createPost } = require('../controllers/post.controller')
const { getUsers, createUser, removeUser, loginUser } = require('../controllers/user.controller')
const { checkToken } = require('../middleware/hasLogin.middleware')
const diskStorage = require('../middleware/uploads.millware')

const upload = multer ({dest: 'uploads/'})
const route = require('express').Router()

route.get('/users', checkToken, getUsers)
route.post('/users', createUser)
route.delete('/users/:id', removeUser)
route.post('/login', loginUser)

route.post("/posts", upload.single("images"), createPost)

module.exports = route
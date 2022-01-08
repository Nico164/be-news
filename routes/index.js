const { text } = require('express')
require('dotenv').config()
const multer = require('multer')
const nodemailer = require('nodemailer')
const { getBanner } = require('../controllers/banner.controller')
const { createPost, removePost, getPost, updatePost, getSinglePost } = require('../controllers/post.controller')
const { getUsers, createUser, removeUser, loginUser, userProfile } = require('../controllers/user.controller')
const { checkToken } = require('../middleware/hasLogin.middleware')
const diskStorage = require('../middleware/uploads.millware')

const upload = multer({ dest: 'uploads/' })
const route = require('express').Router()

route.get('/test-email', (req, res) => {
    const transporter = nodemailer.createTransport({
        service: process.env.EMAIL_SERVICE,
        auth: {
            user: process.env.EMAIL_ACCOUNT,
            pass: process.env.EMAIL_PASSWORD,
        }
    })
    const mailOptions = {
        from: 'admin@news.com',
        to: 'asrul.developer@gmail.com',
        subject: 'Tes Email, nodemailer',
        text: "Hello world",
    }

    transporter.sendMail(mailOptions, function (error, info) {
        if (error) {
            res.send(500).json({
                data: error,
                message: "failed"
            })
        } else {
            res.send(200).json({
                data: 'Email sent: ' + info.response,
                message: "failed",
            })
        }
    })

})

route.get('/users', checkToken, getUsers)
route.post('/users', createUser)
route.delete('/users/:id', removeUser)
route.post('/login', loginUser)
route.get('/profile', checkToken, userProfile)

route.get("/posts", getPost)
route.post("/posts", checkToken, createPost)
route.delete("/posts/:id", checkToken, removePost)
route.put("/posts/:id", checkToken, updatePost)
route.get("/posts/:id", getSinglePost)

route.get("/banners", getBanner)

module.exports = route
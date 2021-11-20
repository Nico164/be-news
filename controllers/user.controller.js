const Model = require('../models')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')

const getUsers = async (req, res) => {
    try {
        const usersData = await Model.User.findAll()
        res.status(200).json({
            data: usersData,
            message: "sucess",
        })
    } catch (error) {
        res.status(500).json({
            data: null,
            message: "server error" + error,
        })
    }

}

const isUnique = async (email) => {
    try {
        const user = await Model.User.findAll({ where: { email } });
        if (user.length > 0) {
            return false;
        } else {
            return true;
        }
    } catch (error) {
        return true;
    }
}

const createUser = async (req, res) => {
    const hash = bcrypt.hashSync(req.body.password, 10);
    try {
        const newUser = {
            firstName: req.body.firstName,
            lastName: req.body.lastName,
            email: req.body.email,
            password: hash,
        };

        if (isUnique(req.body.email)) {
            const saveUser = await Model.User.create(newUser);
            res.status(201).json({
                data: saveUser,
                message: "sucess",
            })
        } else {
            res.status(201).json({
                data: null,
                message: "email already exists",
            });
        }
    }
    catch (error) {
        res.status(500).json({
            data: null,
            message: "server error",
        })
    }
};

const removeUser = async (req, res) => {
    try {
        const id = req.params.id
        const deleteUser = await Model.User.destroy({
            where: {
                id: id,
            }
        })
        res.status(200).json({
            data: deleteUser,
            message: "sucess",
        })
    } catch (error) {
        res.status(500).json({
            data: null,
            message: "server error",
        })
    }

}

const loginUser = async (req, res) => {
    try {
        const email = req.body.email;
        const password = req.body.password;
        const user = await Model.User.findOne({ where: { email } });
        if (user) {
            const checkPassword = bcrypt.compareSync(password, user.password)
            if (checkPassword) {

                const token = jwt.sign({
                    id: user.id,
                    email: user.email,
                }, 'secreet');
                res.status(200).json({
                    data: {
                        token: token
                    },
                    message: 'sucess'
                })
            } else {
                res.status(404).json({
                    data: null,
                    message: 'wrong password'
                })
            }

        } else {
            res.status(404).json({
                data: null,
                message: 'not found'
            })
        }
    }
    catch (error) {
        res.status(500).json({
            data: null,
            message: 'server error'
        })

    }
}

module.exports = {
    getUsers,
    createUser,
    removeUser,
    loginUser,
}
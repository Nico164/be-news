const createPost = async (req, res) => {
    const file =req.file.path
    

    res.status(201).json({
        data: file,
        message: "sucess",
    })
}

module.exports = {
    createPost,
}
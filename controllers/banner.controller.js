const Model = require('../models')

const getBanner = async (req, res) => {
    try {
        const bannerData = await Model.Banner.findAll()
        res.status(200).json({
            data: bannerData,
            message: "sucess",
        })
    } catch (error) {
        res.status(500).json({
            data: null,
            message: "server error" + error,
        })
    }

}

module.exports = {
    getBanner, 
    
}


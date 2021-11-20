'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.addColumn(
      "Posts",
      "author",
      {
        type: Sequelize.INTEGER,
        allowNull: true,
      }
    )
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.removeColumn('Posts, author')
  },
};

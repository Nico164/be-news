'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
   return queryInterface.bulkInsert('Users', [{
     firstName: "John",
     lastName: "Doe",
     email:"John.Doe@gmail.com",
     password: "12345",
    createdAt: new Date(),
    updatedAt: new Date(),
   }])
  },

  down: async (queryInterface, Sequelize) => {
    /**
     * Add commands to revert seed here.
     *
     * Example:
     * await queryInterface.bulkDelete('People', null, {});
     */
  }
};

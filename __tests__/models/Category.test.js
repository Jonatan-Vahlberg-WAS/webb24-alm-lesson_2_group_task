const mongoose = require("mongoose")
const {MongoMemoryServer} = require("mongodb-memory-server") 
const Category = require("../../models/Category")

let mongoServer

beforeAll(async () => {
    mongoServer = await MongoMemoryServer.create()
    await mongoose.connect(mongoServer.getUri())
});

afterAll(async () => {
    await mongoose.disconnect()
    await mongoServer.stop()
});

beforeEach(async () => {
    await Category.deleteMany({})
});

describe("Category Model Tests", () => {
    const validCategoryData = {
        name: "Electronics",
        description: "Test Description"
    }

    test("should create a category successfully", async () => {
        const category = new Category(validCategoryData)
        const savedCategory = await category.save()

        expect(savedCategory._id).toBeDefined()
        expect(savedCategory.name).toBe(validCategoryData.name)
        expect(savedCategory.description).toBe(validCategoryData.dascription)
        expect(savedCategory.isActive).toBe(true)
    })

    test("should require name field", async () => {
        const category = new Category({})

        let err;
        try {
            await category.save()
        } catch (error) {
            err = error;
        }

        expect(err).toBeDefined()
        expect(err.errors.name).toBeDefined()
    })
});
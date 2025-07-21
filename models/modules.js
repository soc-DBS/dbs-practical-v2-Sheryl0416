const { PrismaClient, Prisma } = require("@prisma/client");
const prisma = new PrismaClient();

// CREATE
module.exports.create = function create(code, name, credit) {
  return prisma.module
    .create({
      data: {
        modCode: code,
        modName: name,
        creditUnit: parseInt(credit),
      },
    })
    .then((module) => module)
    .catch((error) => {
      if (error instanceof Prisma.PrismaClientKnownRequestError) {
        if (error.code === "P2002") {
          throw new Error(`The module ${code} already exists`);
        }
      }
      throw error;
    });
};

// UPDATE
module.exports.updateByCode = function updateByCode(code, credit) {
  return prisma.module
    .update({
      where: { modCode: code }, // ✅ fixed field name
      data: { creditUnit: parseInt(credit) }, // ✅ correct field name too
    })
    .then(function (module) {
      // success
    })
    .catch(function (error) {
      if (error instanceof Prisma.PrismaClientKnownRequestError) {
        if (error.code === "P2025") {
          throw new Error(`The module ${code} does not exist`);
        }
      }
      throw error;
    });
};

// DELETE
module.exports.deleteByCode = async function deleteByCode(code) {
  try {
    await prisma.preRequisite.deleteMany({
      where: {
        OR: [{ modCode: code }, { requisite: code }],
      },
    });

    await prisma.studModPerformance.deleteMany({
      where: {
        modRegistered: code,
      },
    });

    await prisma.module.delete({
      where: { modCode: code },
    });
  } catch (error) {
    if (error instanceof Prisma.PrismaClientKnownRequestError) {
      if (error.code === "P2025") {
        throw new Error(`The module ${code} does not exist`);
      }
    }
    throw error;
  }
};

// RETRIEVE ALL
module.exports.retrieveAll = function retrieveAll() {
  return prisma.module.findMany();
};

// RETRIEVE ONE
module.exports.retrieveByCode = function retrieveByCode(code) {
  return prisma.module
    .findUnique({
      where: { modCode: code },
    })
    .then(function (module) {
      if (!module) {
        throw new Error(`The module ${code} does not exist`);
      }
      return module;
    });
};

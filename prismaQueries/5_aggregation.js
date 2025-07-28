const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();
const util = require("util");

function getMeanCourseFee() {
  return prisma.course.aggregate({
    _avg: {
      crseFee: true,
    },
  });
}

/** Section A */

function getNumberOfFullTimeStaff() {
  return prisma.staff.count({
    where: {
      typeOfEmployment: "FT",
    },
  });
}

/** Section B */

function getTotalAllowanceOfStaffByGrade() {
  return prisma.staff.groupBy({
    by: ["grade"],
    _sum: {
      allowance: true,
    },
    orderBy: {
      grade: "asc",
    },
  });
}

function getTotalPayAndNoOfStaffByDeptWithHighTotal() {
  return prisma.staff.groupBy({
    by: ["deptCode"],
    _sum: {
      pay: true,
    },
    _count: {
      staffNo: true,
    },
    having: {
      pay: {
        _sum: {
          gt: 10000,
        },
      },
    },
    orderBy: {
      deptCode: "asc",
    },
  });
}

/** Using Raw Query */

function getAvgLabFeeWithRawQuery() {
  return prisma.$queryRaw`SELECT AVG(COALESCE(lab_fee, 0)) AS "Mean Lab Fee" FROM course;`;
}

async function main(argument) {
  let results;
  switch (argument) {
    case "getMeanCourseFee":
      results = await getMeanCourseFee();
      break;
    case "getNumberOfFullTimeStaff":
      results = await getNumberOfFullTimeStaff();
      break;
    case "getTotalAllowanceOfStaffByGrade":
      results = await getTotalAllowanceOfStaffByGrade();
      break;
    case "getTotalPayAndNoOfStaffByDeptWithHighTotal":
      results = await getTotalPayAndNoOfStaffByDeptWithHighTotal();
      break;
    case "getAvgLabFeeWithRawQuery":
      results = await getAvgLabFeeWithRawQuery();
      break;
    default:
      console.log("Invalid argument");
  }
  results &&
    console.log(
      util.inspect(results, { showHidden: false, depth: null, colors: true })
    );
}

main(process.argv[2]);

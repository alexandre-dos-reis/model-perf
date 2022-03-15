import { PrismaClient } from '@prisma/client'
import createQuestions from './fixtures/createQuestions'
import createTags from './fixtures/createTags'
import createUtilisateurs from './fixtures/createUtilisateurs'
import createUTypes from './fixtures/createUTypes'
import creatQCMs from './fixtures/createQCMs'

const prisma = new PrismaClient()

async function main() {
  
  // createUTypes()
  // createUtilisateurs()
  // createQuestions()
  // createTags()
  creatQCMs()


  
}

main()
  .catch((e) => {
    throw e
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
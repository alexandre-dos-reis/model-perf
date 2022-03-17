import { PrismaClient } from '@prisma/client'
import createConcepteurs from './fixtures/createConcepteurs'
import createExamens from './fixtures/createExamens'
import createQCM from './fixtures/createQCM'
import createQuestions from './fixtures/createQuestions'
import createReponses from './fixtures/createReponses'
import createUsers from './fixtures/createUsers'
import createAuditeursAndGroupes from './fixtures/createAuditeursAndGroupes'
import { clear } from './fixtures/prismaUtils'
import createReponseAuditeurExams from './fixtures/createReponseAuditeurExams'
import createOptions from './fixtures/createOptions'
import bonneReponses from './measures/bonneReponses'

const prisma = new PrismaClient()

async function main() {

  // createUsers()
  // createConcepteurs()
  // createQuestions()
  // createReponses()
  // createQCM()
  // createExamens()
  // createAuditeursAndGroupes()
  // createReponseAuditeurExams()
  // createOptions()

  bonneReponses()
  

  

  
  
}

main()
  .catch((e) => {
    throw e
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
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

const prisma = new PrismaClient()

async function main() {

  // clear("mysql")

  // createUsers()
  // createConcepteurs()
  // createQuestions()
  // createReponses()
  // createQCM()
  // createExamens()
  // createAuditeursAndGroupes()
  // createReponseAuditeurExams()
  // createOptions()

  // creer les requêtes et les comparer...

  

  
  
}

main()
  .catch((e) => {
    throw e
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
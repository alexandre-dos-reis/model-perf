import { PrismaClient } from '@prisma/client'
import createQuestions from './fixtures/createQuestions'
import createTags from './fixtures/createTags'
import createUtilisateurs from './fixtures/createUtilisateurs'
import createUTypes from './fixtures/createUTypes'
import creatQCMs from './fixtures/createQCMs'
import createExamens from './fixtures/createExamens'
import createAuditeurGroupe from './fixtures/createAuditeurGroupe'
import createQuestionsQCM from './fixtures/createQuestionQCM'
import createReponses from './fixtures/createReponses'
import createReponseAuditeurExams from './fixtures/createReponsesAuditeursExam'

const prisma = new PrismaClient()

async function main() {
  
  // createUTypes()
  // createUtilisateurs()
  // createQuestions()
  // createTags()
  // creatQCMs()
  // createExamens()
  // createAuditeurGroupe()
  // createQuestionsQCM()
  // createReponses()
  // createReponseAuditeurExams()


  
}

main()
  .catch((e) => {
    throw e
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
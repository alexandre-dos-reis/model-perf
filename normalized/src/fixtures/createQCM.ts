import { Concepteur, PrismaClient, QCM, Question, QuestionQCM, Reponse } from '@prisma/client'
import { faker } from '@faker-js/faker';

const prisma = new PrismaClient()

export default async function createQCM() {

  faker.locale = 'fr';

  // Les concepteurs ont créés 96 QCM sur 10 ans.
  // 24 auditeurs pour un QCM
  // 1 QCM contient 20 questions avec 3,8 réponses par questions
  
  const concepteurs: Concepteur[] = await prisma.concepteur.findMany()

  const QCMs: QCM[] = []

  concepteurs.map(c => {

    const qcm: QCM = {
      IdUtilisateur: c.IdUtilisateur,
      dateCreation: faker.date.past(10)
    }

    QCMs.push(qcm)
  })

  await prisma.qCM.createMany({
    data: QCMs
  })

  const QCMsCreated: QCM[] = await prisma.qCM.findMany()
  const questionsCreated: Question[] = await prisma.question.findMany()

  let questionsQCM: QuestionQCM[] = []

  console.log(questionsCreated.length)
  console.log(QCMsCreated.length)
  
  const indexes: number[] = []

  QCMsCreated.map((qcm, k) => {
    
    // 20 questions par QCM
    for (let i = 1; i < 21; i++) {
      
      if(k * i < questionsCreated.length && !indexes.includes(k * i)){
        
        const questionQCM: QuestionQCM = {
          IdQCM: qcm.IdQCM,
          IdQuestion: questionsCreated[k * i].IdQuestion
        }

        questionsQCM.push(questionQCM)

      }
    
      indexes.push(k * i)

    }
  })

  await prisma.questionQCM.createMany({
    data: questionsQCM
  })

  




}
import { PrismaClient, QCM, Question, QuestionQCM, Utilisateur } from '@prisma/client'
import { faker } from '@faker-js/faker';

const prisma = new PrismaClient()

export default async function createQuestionsQCM() {

    const QCMsCreated: QCM[] = await prisma.qCM.findMany()
    const questionsCreated: Question[] = await prisma.question.findMany()
  
    let questionsQCM: QuestionQCM[] = []
    
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

    
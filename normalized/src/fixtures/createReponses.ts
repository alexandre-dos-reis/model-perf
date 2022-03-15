import { PrismaClient, Question, Reponse } from '@prisma/client'
import { faker } from '@faker-js/faker';

const prisma = new PrismaClient()

export default async function createReponses() {

  faker.locale = 'fr';

  const questions: Question[] = await prisma.question.findMany()
  const reponses: Reponse[] = []

  questions.map(q => {

    const reponsesRelated: Reponse[] = []

    // 1 question contient 3,8 réponses par questions
    for (let i = 0; i <= 3; i++) {
      
      const reponse: Reponse = {
        IdQuestion: q.IdQuestion,
        NumReponse: i,
        intitule: faker.random.words(1),
        exactitude: 0
      }
      reponsesRelated.push(reponse)
    }
    reponsesRelated[0].exactitude = 0
    reponsesRelated[1].exactitude = 20
    reponsesRelated[2].exactitude = 20
    reponsesRelated[3].exactitude = 60

    reponses.push(...reponsesRelated)
  })

  await prisma.reponse.createMany({
    data: reponses
  })

}
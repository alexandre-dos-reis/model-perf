import { PrismaClient, Question, Utilisateur } from '@prisma/client'
import { faker } from '@faker-js/faker';

const prisma = new PrismaClient()

export default async function createQuestions() {

    faker.locale = 'fr';

    const utilisateurs: Utilisateur[] = await prisma.utilisateur.findMany({
        take: 16 // 20% de 80 concepteurs
    })
  
    let questions: Question[] = []
  
    utilisateurs.map(u => {
        
      // 30 questions par an pendant 10 ans.
      for (let i = 0; i <= 300; i++) {
  
      const q: Question = {
        IdUtilisateur: u.IdUtilisateur,
        points: faker.random.arrayElement([1, 2, 3, 4, 5]),
        description: faker.random.words(20),
        intitule: faker.random.words(1) + " ?",
        TypeQ: faker.random.arrayElement([0, 1, 2, 3])
      }
      
      questions.push(q)
      
    }
  
    })
    
    await prisma.question.createMany({
      data: questions
    })


}
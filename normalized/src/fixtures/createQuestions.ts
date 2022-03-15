import { PrismaClient, Question, QuestionTag, Tag, TypeQuestion, Utilisateur } from '@prisma/client'
import { faker } from '@faker-js/faker';

const prisma = new PrismaClient()

export default async function createQuestions() {

  faker.locale = 'fr';
  
  // TYPE QUESTIONS

  await prisma.typeQuestion.createMany({
      data: [
          {intitule: "Oui/Non"},
          {intitule: "Question ouverte"},
          {intitule: "Question à choix multiple et à réponse unique"},
          {intitule: "Question à choix multiple et réponse multiple"},
      ]
  })

  // QUESTIONS
  

  const typeQuestions: TypeQuestion[] = await prisma.typeQuestion.findMany()
  const utilisateurs: Utilisateur[] = await prisma.utilisateur.findMany({
      take: 16 // 20% de 80 concepteurs
  })

  let questions: Question[] = []

  utilisateurs.map(u => {
    // 30 questions par an pendant 10 ans.
    for (let i = 0; i <= 300; i++) {

    const q: Question = {
      IdTypeQuestion: faker.random.arrayElement(typeQuestions).IdTypeQuestion,
      IdUtilisateur: u.IdUtilisateur,
      points: faker.random.arrayElement([1, 2, 3, 4, 5]),
      description: faker.random.words(20),
      intitule: faker.random.words(1) + " ?",
    }
    
    questions.push(q)
    
  }

  })
  
  await prisma.question.createMany({
    data: questions
  })

  // TAGS
  await prisma.tag.createMany({
    data: [
        {intitule: "Cinéma", couleur: "#C0C0C0"},
        {intitule: "Musique", couleur: "#808080"},
        {intitule: "Séries TV", couleur: "#FF0000"},
        {intitule: "Technologies", couleur: "#F0A804"},
        {intitule: "Bande dessinées", couleur: "#FFFF00"},
        {intitule: "Littérature", couleur: "#008000"},
        {intitule: "Culture Générale", couleur: "#0000FF"},
        {intitule: "Tests d'aptitude", couleur: "#800080"},
        {intitule: "Sport", couleur: "#FFFFFF"},
    ]
  })

  const tags: Tag[] = await prisma.tag.findMany()
  const questionsCreated: Question[] = await prisma.question.findMany()

  const questionsTag: QuestionTag[] = []

  questionsCreated.map(qc => tags.map(t => 
      questionsTag.push({
        IdTag: t.IdTag,
        IdQuestion: qc.IdQuestion,
    })
    )
  )
      
  await prisma.questionTag.createMany({
      data: questionsTag
  })
}
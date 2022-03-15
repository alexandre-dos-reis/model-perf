import { PrismaClient, QuestionTag, Utilisateur } from '@prisma/client'
import { faker } from '@faker-js/faker';

const prisma = new PrismaClient()

export default async function createTags() {

    faker.locale = 'fr';

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

    const tags = await prisma.tag.findMany()
    const questionsTag: QuestionTag[] = []
    const questions = await prisma.question.findMany()

    questions.map(q => {

        const questionTag: QuestionTag = {
            IdQuestion: q.IdQuestion,
            IdTag: faker.random.arrayElement(tags).IdTag
        }

        questionsTag.push(questionTag)

    })

    await prisma.questionTag.createMany({
        data: questionsTag
    })





}
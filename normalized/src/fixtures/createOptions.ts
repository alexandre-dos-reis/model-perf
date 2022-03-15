import { PrismaClient, Utilisateur, Concepteur, OptionExamen } from '@prisma/client'
import { faker } from '@faker-js/faker';

const prisma = new PrismaClient()

export default async function createOptions() {

    faker.locale = 'fr';

    await prisma.option_element.createMany({
        data: [
            {intitule: "Niveau de sécurité"},
            {intitule: "Méthode de soumission des questions"},
            {intitule: "Mélange des réponses"},
            {intitule: "mélange des questions"}
        ]
    })

    const examens = await prisma.examen.findMany()
    const options = await prisma.option_element.findMany()

    const optionsExamen: OptionExamen[] = []

    examens.map(e => {
        
        const optionExamen: OptionExamen = {
            IdExamen: e.IdExamen,
            IdOption: faker.random.arrayElement(options).IdOption,
            val: faker.random.word()
        }

        optionsExamen.push(optionExamen)
    })

    await prisma.optionExamen.createMany({
        data: optionsExamen
    })



}




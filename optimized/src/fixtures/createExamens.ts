import { Examen, Groupe, PrismaClient, QCM, Utilisateur } from '@prisma/client'
import { faker } from '@faker-js/faker';

const prisma = new PrismaClient()

export default async function createExamens() {

    faker.locale = "fr"

    // GROUPES

    const groupes: Groupe[] = []

    for (let i = 0; i < 120; i++) {
        
        const groupe: Groupe = {
            code: i.toString(),
            nom: faker.random.word(),
            description: faker.random.words(1),
        }

        groupes.push(groupe)
    }

    await prisma.groupe.createMany({
        data: groupes
    })

    // EXAMENS

    const QCMsCreated: QCM[] = await prisma.qCM.findMany()
    const groupesCreated = await prisma.groupe.findMany()
    const concepteurs = await prisma.utilisateur.findMany({
        where: {
            TypeU: {
                libelle: "Concepteur"
            }
        }
    })

    const examens: Examen[] = []

    const options: string[] = ["Niveau de sécurité", "Méthode de soumission des questions", "Mélange des réponses", "mélange des questions"]

    groupesCreated.map(g => {

        const examen: Examen = {
            code: g.code,
            IdQCM: faker.random.arrayElement(QCMsCreated).IdQCM,
            IdUtilisateur: faker.random.arrayElement(concepteurs).IdUtilisateur,
            dateD: faker.date.past(10),
            dateF: faker.date.past(10),
            statut: faker.random.arrayElement(["Ouvert", "Fermé", "Visible"]),
            optionJSON: JSON.stringify({
                val: faker.word.noun(),
                intitule: faker.random.arrayElement(options)
            })
        }

        examens.push(examen)

    })

    await prisma.examen.createMany({
        data: examens
    })


}
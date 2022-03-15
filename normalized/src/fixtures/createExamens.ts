import { Concepteur, Examen, Groupe, PrismaClient, QCM, Statut } from '@prisma/client'
import { faker } from '@faker-js/faker';

const prisma = new PrismaClient()

export default async function createExamens() {

  faker.locale = 'fr';

    // ouvert/fermé/visible

    await prisma.statut.createMany({
        data: [
            {libelle: "Ouvert"},
            {libelle: "Fermé"},
            {libelle: "Visible"}
        ]
    })  

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

    const statutCreated: Statut[] = await prisma.statut.findMany()
    const groupesCreated: Groupe[] = await prisma.groupe.findMany()
    const QCMsCreated: QCM[] = await prisma.qCM.findMany()
    const concepteurCreated: Concepteur[] = await prisma.concepteur.findMany()

    const examens: Examen[] = []

    groupesCreated.map(gc => {

        const examen: Examen = {
            code: gc.code,
            IdStatut: faker.random.arrayElement(statutCreated).IdStatut,
            IdQCM: faker.random.arrayElement(QCMsCreated).IdQCM,
            IdUtilisateur: faker.random.arrayElement(concepteurCreated).IdUtilisateur,
            dateD: faker.date.past(10),
            dateF: faker.date.past(10)
        }

        examens.push(examen)
    })

    await prisma.examen.createMany({
        data: examens
    })
}
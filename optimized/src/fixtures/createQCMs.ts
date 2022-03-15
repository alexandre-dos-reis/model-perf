import { PrismaClient, QCM, Utilisateur } from '@prisma/client'
import { faker } from '@faker-js/faker';

const prisma = new PrismaClient()

export default async function creatQCMs() {


    const concepteurs: Utilisateur[] = await prisma.utilisateur.findMany({
        where: {
            TypeU: {
                libelle: "Concepteur"
            }
        }
    })

    

    // const QCMs: QCM[] = []

    // concepteurs.map(c => {
  
    //   const qcm: QCM = {
    //     IdUtilisateur: c.IdUtilisateur,
    //     dateCreation: faker.date.past(10)
    //   }
  
    //   QCMs.push(qcm)
    // })
  
    // await prisma.qCM.createMany({
    //   data: QCMs
    // })


}
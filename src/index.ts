import { PrismaClient } from '@prisma/client'
import express from 'express'
import { hasUncaughtExceptionCaptureCallback } from 'process'

const prisma = new PrismaClient()
const app = express()

app.use(express.json())

// ... your REST API routes will go here
app.get('/hoodid',async(req,res) => {
  const hoods = await prisma.hoodID.findMany()
  res.json(hoods)
})

app.get('/hoodid/:id', async(req,res) => {
  const {id} = req.params
  const post = await prisma.hoodID.findUnique({
    where: {
      id: String(id)
    },
    include: {
      Crime: true,
      Rent: true,
      Income: true,
    }
  })
  res.json(post)
})



app.listen(3000, () =>
  console.log('REST API server ready at: http://localhost:3000'),
)

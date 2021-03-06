﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ParticleSystem
{
    public class ParticleEmitter : Particle
    {
        const int MaxElementsPerUpdateCount = 5;
        const int MaxSpeedPerCordinate = 2;

        protected Random randomGenerator;

        public ParticleEmitter(MatrixCoords position, MatrixCoords speed,
                            Random randomGenerator) : base(position, speed)
        {
            this.randomGenerator = randomGenerator;
        }

        public override char[,] GetImage()
        {
            return new char[,] { { (char)1 } };
        }

        public override IEnumerable<Particle> Update()
        {
            IEnumerable<Particle> particlesSoFar = base.Update();
            List<Particle> allGeneratedParticles = new List<Particle>();

            int particlesToCreateCount = this.randomGenerator.Next(MaxElementsPerUpdateCount + 1);
            for (int i = 0; i < particlesToCreateCount; i++)
            {
                GetRandomParticle(allGeneratedParticles);
            }
            allGeneratedParticles.AddRange(particlesSoFar);

            return allGeneratedParticles;
        }

        protected virtual void GetRandomParticle(List<Particle> allGeneratedParticles)
        {
            var createdSpeed = GetRandomCoorts();

            while (createdSpeed.Row == 0 && createdSpeed.Col == 0)
            {
                createdSpeed = GetRandomCoorts();
            }

            allGeneratedParticles.Add(this.GetNewParticle(this.Position, createdSpeed));
        }

        protected virtual Particle GetNewParticle(MatrixCoords position, MatrixCoords speed)
        {
            return new Particle(position, speed);
        }

        private MatrixCoords GetRandomCoorts()
        {
            int maxSpeedRow = this.randomGenerator.Next(
                -MaxSpeedPerCordinate, MaxSpeedPerCordinate + 1);
            int maxSpeedCol = this.randomGenerator.Next(
                -MaxSpeedPerCordinate, MaxSpeedPerCordinate + 1);

            var createdSpeed = new MatrixCoords(maxSpeedRow, maxSpeedCol);
            return createdSpeed;
        }
    }
}

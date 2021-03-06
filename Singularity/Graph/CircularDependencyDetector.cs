﻿using System;
using System.Collections.Generic;
using System.Linq;
using Singularity.Exceptions;

namespace Singularity.Graph.Resolvers
{
    internal class CircularDependencyDetector
    {
        private readonly HashSet<Type> _visitedDependencies = new HashSet<Type>();

        public void Enter(Type type)
        {
            if (_visitedDependencies.Contains(type))
            {
                var error = new CircularDependencyException(_visitedDependencies.Concat(new[] { type }).ToArray());
                throw error;
            }
            _visitedDependencies.Add(type);
        }

        public void Leave(Type type)
        {
            _visitedDependencies.Remove(type);
        }
    }
}
﻿using System;
using Singularity.Attributes;
using Singularity.Exceptions;

namespace Singularity
{
    /// <summary>
    /// Interface for a singularity container.
    /// </summary>
    public interface IContainer : IDisposable
    {
        /// <summary>
        /// Resolves a instance for the given dependency type
        /// </summary>
        /// <typeparam name="T">The type of the dependency</typeparam>
        /// <exception cref="DependencyNotFoundException">If the dependency is not configured</exception>
        /// <returns></returns>
        T GetInstance<T>() where T : class;

        /// <summary>
        /// Resolves a instance for the given dependency type
        /// </summary>
        /// <param name="type">The type of the dependency</param>
        /// <exception cref="DependencyNotFoundException">If the dependency is not configured</exception>
        /// <returns></returns>
        object GetInstance(Type type);

        /// <summary>
        /// Injects dependencies by calling all methods marked with <see cref="InjectAttribute"/> on the <paramref name="instance"/>.
        /// </summary>
        /// <param name="instance"></param>
        /// <exception cref="DependencyNotFoundException">If the method had parameters that couldn't be resolved</exception>
        void MethodInject(object instance);
    }
}
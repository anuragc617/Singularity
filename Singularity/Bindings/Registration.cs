﻿using System;
using System.Collections.Generic;
using Singularity.Exceptions;

namespace Singularity.Bindings
{
    internal class Registration
    {
        public Type[] DependencyTypes { get; }
        public List<WeaklyTypedBinding> Bindings { get; } = new List<WeaklyTypedBinding>();

        public Registration(Type[] dependencyTypes)
        {
            DependencyTypes = dependencyTypes ?? throw new ArgumentNullException(nameof(dependencyTypes));
        }

        internal void Verify(List<WeaklyTypedDecoratorBinding>? decorators)
        {
            foreach (WeaklyTypedBinding weaklyTypedBinding in Bindings)
            {
                if (weaklyTypedBinding.Expression == null && (decorators == null || decorators!.Count == 0))
                {
                    throw new BindingConfigException($"The binding at {weaklyTypedBinding.BindingMetadata.StringRepresentation()} does not have a expression");
                }

                if (decorators != null)
                {
                    foreach (WeaklyTypedDecoratorBinding weaklyTypedDecoratorBinding in decorators)
                    {
                        if (weaklyTypedDecoratorBinding.Expression == null)
                            throw new BindingConfigException($"The decorator for {DependencyTypes} does not have a expression");
                    }
                }
            }
        }
    }
}
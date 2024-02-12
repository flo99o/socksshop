﻿global using System.Data.Common;
global using Npgsql;
global using System.Runtime.Serialization;
global using Dapper;
global using FluentValidation;
global using MediatR;
global using Microsoft.AspNetCore.Mvc;
global using Microsoft.EntityFrameworkCore;
global using eShop.EventBus.Abstractions;
global using eShop.EventBus.Events;
global using eShop.EventBus.Extensions;
global using eShop.IntegrationEventLogEF;
global using eShop.IntegrationEventLogEF.Services;
global using eShop.Ordering.API;
global using eShop.Ordering.API.Application.Behaviors;
global using eShop.Ordering.API.Application.Commands;
global using eShop.Ordering.API.Application.IntegrationEvents;
global using eShop.Ordering.API.Application.IntegrationEvents.EventHandling;
global using eShop.Ordering.API.Application.IntegrationEvents.Events;
global using eShop.Ordering.API.Application.Models;
global using eShop.Ordering.API.Application.Queries;
global using eShop.Ordering.API.Application.Validations;
global using eShop.Ordering.API.Extensions;
global using eShop.Ordering.API.Infrastructure;
global using eShop.Ordering.API.Infrastructure.Services;
global using eShop.Ordering.Domain.AggregatesModel.BuyerAggregate;
global using eShop.Ordering.Domain.AggregatesModel.OrderAggregate;
global using eShop.Ordering.Domain.Events;
global using eShop.Ordering.Domain.Exceptions;
global using eShop.Ordering.Domain.SeedWork;
global using eShop.Ordering.Infrastructure;
global using eShop.Ordering.Infrastructure.Idempotency;
global using eShop.Ordering.Infrastructure.Repositories;
global using Microsoft.Extensions.Options;
global using Polly;
global using Polly.Retry;
global using eShop.ServiceDefaults;
global using Swashbuckle.AspNetCore.SwaggerGen;

using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TostaoApp.Models;

namespace TostaoApp.Data
{
    public class TostaoDataContext : DbContext
    {
        public DbSet<TransacaoModel> Transacaos { get; set; }
        public DbSet<CategoriaModel> Categorias { get; set; }
        public DbSet<TipoModel> Tipos { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
            => optionsBuilder.UseSqlServer("Server=;Database=;User ID=;Password=;MultipleActiveResultSets=true;");
    }
}
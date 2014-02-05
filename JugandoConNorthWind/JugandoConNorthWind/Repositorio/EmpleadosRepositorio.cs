using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using JugandoConNorthWind.ModeloNorthWind;
namespace JugandoConNorthWind.Repositorio
{
    public class EmpleadosRepositorio
    {
        private NorthwindEntities _context;

        public EmpleadosRepositorio(NorthwindEntities context)
        {
            _context = context;
        }

        public IEnumerable<Employees> ListaEmpleados()
        {
            return _context.Employees.ToList();
        }
    }
}
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
	public partial class Vuelta : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			LblDestino.Text = Request.Form["destino"];
			LblCategoria.Text = Request.Form["estrella"];
			LblCantidadDePersonas.Text = Request.Form["TxtCantidad"];
			LblCantidadDeDias.Text = Request.Form["TxtDias"];
		}
	}
}

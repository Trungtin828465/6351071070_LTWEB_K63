﻿using BOOK.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;

namespace BOOK.Controllers
{
    public class DefaultController : Controller
    {

        QlsachEntities10 data = new QlsachEntities10();
        // GET: Default

        private List<SACH> Laysachmoi(int count)
        {
            // Sort by descending update date and take the top 'count' records
            return data.SACHes.OrderByDescending(a => a.NgayCapNhat).Take(count).ToList();
        }

        public ActionResult Index( int ? page)
        {
            int pageSize = 4;
            int pageNum = (page ?? 1);
            // Retrieve the 5 latest books
            var sachmoi = Laysachmoi(20);

            return View(sachmoi.ToPagedList(pageNum, pageSize));
        }





        public ActionResult Chude()
        {
            var chude = from cd in data.CHUDEs select cd;
            return PartialView(chude);
        }

        public ActionResult NhaXB()
        {
            var xb = from cd in data.NHAXUATBANs select cd;
            return PartialView(xb);
        }

        public ActionResult Details(int id)
        {
            var sach = data.SACHes.SingleOrDefault(s => s.MaSach == id);
            if (sach == null)
            {
                return HttpNotFound();
            }
            return View(sach);
        }


        public ActionResult SPTheochude(int id)
        {
           
                var sach = from s in data.SACHes where s.MaCD == id select s;
                return View(sach);
            

        }
        public ActionResult SPTheoNhaXB(int id )
        {
                var sach = from s in data.SACHes where s.MaNXB == id select s;
                return View(sach);
            

        }

    }
}
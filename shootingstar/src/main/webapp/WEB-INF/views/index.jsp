<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp"%>
<style>
.img-fluid{
	width:400px;	
	height:250px;	
}
</style>
<head>
    <!-- Custom styles for this template -->
    <link href="css/agency.css" rel="stylesheet">
</head>
 <!-- Portfolio Grid -->
    <section class="bg-light" id="portfolio">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">Portfolio</h2>
            <h3 class="section-subheading text-muted">category</h3>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4 col-sm-6 portfolio-item">
            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal1">
              <div class="portfolio-hover">
                <div class="portfolio-hover-content">
                  <i class="fa fa-plus fa-3x">카테고리</i>
                </div>
              </div>
              <img class="img-fluid" src="<c:url value='/images/profile.jpg'/>" alt="">
            </a>
            <div class="portfolio-caption">
              <h4>Profile</h4>
              <p class="text-muted">인물/프로필</p>
            </div>
          </div>
          <div class="col-md-4 col-sm-6 portfolio-item">
            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal2">
              <div class="portfolio-hover">
                <div class="portfolio-hover-content">
                  <i class="fa fa-plus fa-3x">카테고리</i>
                </div>
              </div>
              <img class="img-fluid" src="<c:url value='/images/food.jpg'/>" alt="">
            </a>
            <div class="portfolio-caption">
              <h4>Food</h4>
              <p class="text-muted">음식</p>
            </div>
          </div>
          <div class="col-md-4 col-sm-6 portfolio-item">
            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal3">
              <div class="portfolio-hover">
                <div class="portfolio-hover-content">
                  <i class="fa fa-plus fa-3x">카테고리</i>
                </div>
              </div>
              <img class="img-fluid" src="<c:url value='/images/fashion.jpg'/>" alt="">
            </a>
            <div class="portfolio-caption">
              <h4>Fashion</h4>
              <p class="text-muted">패션</p>
            </div>
          </div>
          <div class="col-md-4 col-sm-6 portfolio-item">
            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal4">
              <div class="portfolio-hover">
                <div class="portfolio-hover-content">
                  <i class="fa fa-plus fa-3x">카테고리</i>
                </div>
              </div>
              <img class="img-fluid" src="<c:url value='/images/wedding.jpg'/>" alt="">
            </a>
            <div class="portfolio-caption">
              <h4>Wedding</h4>
              <p class="text-muted">웨딩</p>
            </div>
          </div>
          <div class="col-md-4 col-sm-6 portfolio-item">
            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal5">
              <div class="portfolio-hover">
                <div class="portfolio-hover-content">
                  <i class="fa fa-plus fa-3x">카테고리</i>
                </div>
              </div>
              <img class="img-fluid" src="<c:url value='/images/party.jpg'/>" alt="">
            </a>
            <div class="portfolio-caption">
              <h4>Event</h4>
              <p class="text-muted">행사</p>
            </div>
          </div>
          <div class="col-md-4 col-sm-6 portfolio-item">
            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal6">
              <div class="portfolio-hover">
                <div class="portfolio-hover-content">
                  <i class="fa fa-plus fa-3x">카테고리</i>
                </div>
              </div>
              <img class="img-fluid" src="<c:url value='/images/interior.jpg'/>" alt="">
            </a>
            <div class="portfolio-caption">
              <h4>Interior</h4>
              <p class="text-muted">인테리어</p>
            </div>
          </div>
           <div class="col-md-4 col-sm-6 portfolio-item">
            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal6">
              <div class="portfolio-hover">
                <div class="portfolio-hover-content">
                  <i class="fa fa-plus fa-3x">카테고리</i>
                </div>
              </div>
              <img class="img-fluid" src="<c:url value='/images/concert.jpg'/>" alt="">
            </a>
            <div class="portfolio-caption">
              <h4>Concert</h4>
              <p class="text-muted">공연</p>
            </div>
          </div>
           <div class="col-md-4 col-sm-6 portfolio-item">
            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal6">
              <div class="portfolio-hover">
                <div class="portfolio-hover-content">
                  <i class="fa fa-plus fa-3x">카테고리</i>
                </div>
              </div>
              <img class="img-fluid" src="<c:url value='/images/advertisment.jpg'/>" alt="">
            </a>
            <div class="portfolio-caption">
              <h4>Advertisment</h4>
              <p class="text-muted">광고</p>
            </div>
          </div>
           <div class="col-md-4 col-sm-6 portfolio-item">
            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal6">
              <div class="portfolio-hover">
                <div class="portfolio-hover-content">
                  <i class="fa fa-plus fa-3x">카테고리</i>
                </div>
              </div>
              <img class="img-fluid" src="<c:url value='/images/snap.jpg'/>" alt="">
            </a>
            <div class="portfolio-caption">
              <h4>Snap</h4>
              <p class="text-muted">스냅사진</p>
            </div>
          </div>
        </div>
      </div>
    </section>


<%@ include file="inc/bottom.jsp"%>
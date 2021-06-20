import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app002/constant/color_constant.dart';
import 'package:flutter_app002/customs_icons/flutter_custom_icon.dart';
import 'package:flutter_app002/models/card_model.dart';
import 'package:flutter_app002/models/transaction_model.dart';
import 'package:flutter_app002/models/wallet_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';
class HomeScreen extends StatefulWidget {


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.menu,color: Colors.black54,),
          onPressed: (){},
          padding: EdgeInsets.only(left: 8.0),
        ),
      ),


      bottomNavigationBar:BottomAppBar(
        color: Colors.transparent,
        elevation: 0.0,
        child: Container(
          height: 56.0,
          margin: EdgeInsets.only(left: 16.0,bottom: 16.0,right: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient: LinearGradient(
              colors: kGradientSlideButton,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.mirror,
              stops: const <double>[0.0,1.0]
            ),
          ),
          child: ConfirmationSlider(
            onConfirmation: (){},
            height: 56.0,
            width: MediaQuery.of(context).size.width-32,
            backgroundColor: Colors.transparent,
            shadow: BoxShadow(
              color: Colors.transparent
            ),
            foregroundColor: Colors.white,
            foregroundShape: BorderRadius.circular(8),
            icon: MyFlutterApp.slide_icon,
            iconColor: Colors.blue,
            text: 'Slide for Payment',
            textStyle:GoogleFonts.nunito(
              fontSize:14.0,
              color: Colors.white,
              fontWeight: FontWeight.w700
            ),
          ),
        ),
      ),


        body: Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            // Card Account Section
            Padding(
              padding: EdgeInsets.only(left: 24.0,top: 8.0 , bottom: 16.0),
              child: Text('Hi, Alex',style: GoogleFonts.nunito(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,color: Colors.black
              ),),
            ),
            Container(
              height: 175.0,
              padding: EdgeInsets.only(left: 16.0 , right: 8.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount:cards.length ,
                  itemBuilder: (context , index){
                    return Container(
                      margin: EdgeInsets.only(right: 8.0),
                      height: 175.0,
                      width: 250.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: cards[index].bgColor,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x10000000),
                            blurRadius: 10.0,
                            spreadRadius: 4.0,
                            offset: Offset(0.0,8.0)

                          )
                        ]
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left:16.0,
                            top: 12.0,
                            child: Image.asset(cards[index].type,height: 22.0,width: 33.0,),
                          ),
                          Positioned(
                            right: 12.0,
                            top: 12.0,
                            child: SvgPicture.asset(cards[index].cardBackground),
                          ),
                          Positioned(
                            top: 14.0,
                            right: 12.0,
                            child: Text(cards[index].name,style: GoogleFonts.nunito(fontSize: 12.0,fontWeight: FontWeight.w400,color: cards[index].firstColor),),
                          ),
                          Positioned(
                            top: 63.0,
                            left: 16.0,
                            child: Text('Your Balance',style: GoogleFonts.nunito(fontSize: 12.0,fontWeight: FontWeight.w400,color: cards[index].firstColor),),
                          ),
                          Positioned(
                            left: 16.0,
                            top: 81.0,
                            child: Text('Rp'+cards[index].balance,style: GoogleFonts.nunito(fontSize: 20.0,fontWeight: FontWeight.w700,color: cards[index].secondColor),),
                          ),
                          Positioned(
                            left: 16.0,
                            bottom: 30.0,
                            child: Text('Valid',style: GoogleFonts.nunito(fontSize: 12.0,fontWeight: FontWeight.w400,color: cards[index].firstColor),),
                          ),
                          Positioned(
                            left: 16.0,
                            bottom: 12.0,
                            child: Text(cards[index].valid,style: GoogleFonts.nunito(fontSize: 14.0,fontWeight: FontWeight.w700,color: cards[index].secondColor),),
                          ),
                          Positioned(
                            right: 8.0,
                            left: 8.0,
                            child: SvgPicture.asset(cards[index].moreIcon,height: 24.0,width: 24.0,),
                          )

                        ],
                      ),
                    );

                  }),
            ),

            //LAST TRANSACTION
            Padding(
              padding: EdgeInsets.only(left: 24.0,top: 32.0 , bottom: 16.0,right: 24.0),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Last Transaction',style: GoogleFonts.nunito(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,color: Colors.black
                  ),),
                  Text('See all Transaction',style: GoogleFonts.nunito(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w700,color: Colors.blue
                  ),),
                ],
              )
            ),

            Container(
              height: 190.0,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 16.0,right: 8.0),
                scrollDirection: Axis.horizontal,
                  itemCount: transactions.length,
                  itemBuilder: (context , index){
                    return Container(
                  margin: EdgeInsets.only(right: 8.0),
                      height: 190.0,
                      width: 160.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x04000000),
                            blurRadius: 10.0,
                            spreadRadius: 10.0,
                            offset: Offset(0.0,0.0),
                          )
                        ]
                      ),
                      child: Stack(
                        children: [
                         Positioned(
                           left:16.0,
                           top: 16.0,
                           child: SvgPicture.asset(transactions[index].type,height: 24.0,width: 24.0,),
                         ),
                          Positioned(
                            right: 8.0,
                            top: 8.0,
                            child: SvgPicture.asset('assets/svg/mastercard_bg.svg'),
                          ),
                          Positioned(
                            top:16.0,
                            right: 16.0,
                            child: Text(transactions[index].name,style: GoogleFonts.nunito(fontSize: 12.0,fontWeight: FontWeight.w700,color:transactions[index].colorType ),),
                          ),
                          Positioned(
                            top:64.0,
                            left: 16.0,
                            child: Text(transactions[index].signType+'Rp'+transactions[index].amount,style: GoogleFonts.nunito(fontSize: 16.0,fontWeight: FontWeight.w700,color: transactions[index].colorType),),
                          ),
                          Positioned(
                            left: 16.0,
                            top: 106.0,
                            child: Text(transactions[index].information,style: GoogleFonts.nunito(fontSize: 12.0,fontWeight: FontWeight.w400,color: Colors.grey),),
                          ),
                          Positioned(
                            left: 16.0,
                            bottom: 48.0,
                            child: Text(transactions[index].recipient,style: GoogleFonts.nunito(fontSize: 12.0,fontWeight: FontWeight.w700,color:Colors.black),),
                          ),
                          Positioned(
                            left: 16.0,
                            bottom: 22.0,
                            child: Text(transactions[index].date,style: GoogleFonts.nunito(fontSize: 12.0,fontWeight: FontWeight.w400,color:Colors.grey),),
                          ),
                          Positioned(
                            right: 14.0,
                            bottom: 16.0,
                            child: Image.asset(transactions[index].card,height: 22.0,width: 33.0,),
                          )
                        ],
                      ),

                );

              }),
            ),

            //TOPUP SECTION


            Padding(
              padding: EdgeInsets.only(left: 24.0,top: 8.0 , bottom: 16.0),
              child: Text('Top Up Again',style: GoogleFonts.nunito(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,color: Colors.black
              ),),
            ),
            Container(
              height: 304.0,
              child: ListView.builder(
                itemCount: wallets.length,
                  padding: EdgeInsets.only(left: 16.0,right: 16.0),
                  itemBuilder:(context , index){
                    return Container(
                      margin: EdgeInsets.only(bottom: 8.0),
                      height: 68.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x04000000),
                              blurRadius: 10.0,
                              spreadRadius: 10.0,
                              offset: Offset(0.0,0.0),
                            )
                          ],

                        color:Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 12.0,),
                              Container(
                                width: 44.0,
                                height:44.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey,
                                  image:DecorationImage(
                                    image:AssetImage(wallets[index].walletLogo)
                                  )
                                ),

                              ),
                              SizedBox(width: 12.0,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(wallets[index].name,style: GoogleFonts.nunito(fontSize: 14.0,fontWeight: FontWeight.w700,color:Colors.black),),
                                  Text(wallets[index].wallet,style: GoogleFonts.nunito(fontSize: 12.0,fontWeight: FontWeight.w700,color:Colors.grey),),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(wallets[index].walletNumber,style: GoogleFonts.nunito(fontSize: 12.0,fontWeight: FontWeight.w700,color:Colors.grey),),
                              SizedBox(width: 16.0,),

                            ],
                          )
                        ],
                      ),
                    );
                  } ),
            )



          ],
        ),
      ),
    );
  }
}

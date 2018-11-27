//+------------------------------------------------------------------+
//|                                                 ema_scalping.mq4 |
//|                                  Copyright 2018, Gustavo Carmona |
//|                                           http://www.awtt.com.ar |
//+------------------------------------------------------------------+
#property copyright "Copyright 2018, Gustavo Carmona"
#property link      "http://www.awtt.com.ar"
#property version   "1.00"
#property strict

#define UPTREND 0
#define DOWNTREND 1
#define NOTREND 2


int trend, lastTrend;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   trend=NOTREND;
   lastTrend = NOTREND;
   trend = getTrend();
   
   if(trend<2)
      lastTrend = trend;
      Alert(trend);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   Sleep(500);
   trend = getTrend();
   if(trend!=lastTrend){
      Print("setOrder();");
      lastTrend = trend;
      }
   
  }
//+------------------------------------------------------------------+

int getTrend(){
   int tren=2;
   double ema1,ema2,ema3;
   ema1 = iMA(Symbol(),0,8,1,MODE_EMA,PRICE_CLOSE,1);
   ema2 = iMA(Symbol(),0,13,1,MODE_EMA,PRICE_CLOSE,1);
   ema3 = iMA(Symbol(),0,21,1,MODE_EMA,PRICE_CLOSE,1);
   if(ema1<ema2 && ema2<ema3)
     trend = DOWNTREND;
   if(ema3<ema2 && ema2<ema1)
      trend = UPTREND;   
   

   return trend;
   }
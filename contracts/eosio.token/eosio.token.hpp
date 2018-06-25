/**
 *  @file
 *  @copyright defined in eos/LICENSE.txt
 */
#pragma once

// 资产头文件
#include <eosiolib/asset.hpp>
// 合约库头文件
#include <eosiolib/eosio.hpp>

#include <string>

namespace eosiosystem {
   class system_contract;
}

namespace eosio {

   using std::string;

    // 继承自contract合约
   class token : public contract {
      public:
            // 账号名是64bit无符号整数
         token( account_name self ):contract(self){}

            // 创建币
            // 发币人账号
         void create( account_name issuer,
                        // 发行资产最大数目
                      asset        maximum_supply);

            // 发币
         void issue( account_name to, asset quantity, string memo );

            // 转账
         void transfer( account_name from,
                        account_name to,
                        asset        quantity,
                        string       memo );
      
      
         inline asset get_supply( symbol_name sym )const;
         
         inline asset get_balance( account_name owner, symbol_name sym )const;

      private:
         struct account {
            // 余额
            asset    balance;

            // 主键
            uint64_t primary_key()const { return balance.symbol.name(); }
         };

         struct currency_stats {
            // 流通量
            asset          supply;
            // 最大流通量
            asset          max_supply;
            // 发币人
            account_name   issuer;

            uint64_t primary_key()const { return supply.symbol.name(); }
         };

            // 账号表
         typedef eosio::multi_index<N(accounts), account> accounts;
            // 币信息表
         typedef eosio::multi_index<N(stat), currency_stats> stats;

         void sub_balance( account_name owner, asset value );
         void add_balance( account_name owner, asset value, account_name ram_payer );

      public:
         struct transfer_args {
            account_name  from;
            account_name  to;
            asset         quantity;
            string        memo;
         };
   };

   asset token::get_supply( symbol_name sym )const
   {
      stats statstable( _self, sym );
      const auto& st = statstable.get( sym );
      return st.supply;
   }

   asset token::get_balance( account_name owner, symbol_name sym )const
   {
      accounts accountstable( _self, owner );
      const auto& ac = accountstable.get( sym );
      return ac.balance;
   }

} /// namespace eosio

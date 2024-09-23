//
//  MockProducts.swift
//  MeliMobileChallengeTests
//
//  Created by Santiago Castañeda on 23/09/24.
//

import Foundation

class MockProducts {
    static let productJSON = """
        {
        "site_id": "MLA",
        "country_default_time_zone": "GMT-03:00",
        "query": "pc gamer",
        "paging": {
          "total": 8627,
          "primary_results": 1000,
          "offset": 0,
          "limit": 50
        },
        "results": [
          {
            "id": "MLA1128472052",
            "title": "Pc Armada Gamer Ryzen 7 5700g 32gb Vega 8 960gb Wifi",
            "condition": "new",
            "thumbnail_id": "649332-MLA76740809050_062024",
            "catalog_product_id": null,
            "listing_type_id": "gold_special",
            "sanitized_title": "pc-armada-gamer-ryzen-7-5700g-32gb-vega-8-960gb-wifi",
            "permalink": "https://articulo.mercadolibre.com.ar/MLA-1128472052-pc-armada-gamer-ryzen-7-5700g-32gb-vega-8-960gb-wifi-_JM",
            "buying_mode": "buy_it_now",
            "site_id": "MLA",
            "category_id": "MLA1649",
            "domain_id": "MLA-DESKTOP_COMPUTER_KITS",
            "thumbnail": "http://http2.mlstatic.com/D_649332-MLA76740809050_062024-I.jpg",
            "currency_id": "ARS",
            "order_backend": 1,
            "price": 734356.65,
            "original_price": 895500,
            "sale_price": {
              "price_id": "",
              "amount": 734356.65,
              "conditions": {
                "eligible": true,
                "context_restrictions": [
                  "channel_marketplace"
                ],
                "start_time": "2024-09-01T03:54:26Z",
                "end_time": "2024-10-01T02:50:00Z"
              },
              "currency_id": "ARS",
              "exchange_rate": null,
              "payment_method_prices": [],
              "payment_method_type": "TMP",
              "regular_amount": 895500,
              "type": "promotion",
              "metadata": {
                "campaign_discount_percentage": 17.99,
                "campaign_end_date": "2024-10-01T02:50:00Z",
                "campaign_id": "P-MLA14209002",
                "order_item_price": 770273.6,
                "promotion_id": "OFFER-MLA1128472052-10179961802",
                "promotion_type": "marketplace_campaign",
                "discount_meli_amount": 35916.95,
                "experiment_id": "cm_med_uplift_P-MLA14209002",
                "funding_mode": "coupon",
                "variation": "51580"
              }
            },
            "available_quantity": 500,
            "official_store_id": null,
            "use_thumbnail_id": true,
            "accepts_mercadopago": true,
            "shipping": {
              "store_pick_up": false,
              "free_shipping": true,
              "logistic_type": "xd_drop_off",
              "mode": "me2",
              "tags": [
                "self_service_in",
                "mandatory_free_shipping"
              ],
              "benefits": null,
              "promise": null,
              "shipping_score": -1
            },
            "stop_time": "2042-03-16T04:00:00.000Z",
            "seller": {
              "id": 179064066,
              "nickname": "ELECTRO.PC"
            },
            "attributes": [
              {
                "id": "BRAND",
                "name": "Marca",
                "value_id": "18034",
                "value_name": "AMD",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Otros",
                "value_struct": null,
                "values": [
                  {
                    "id": "18034",
                    "name": "AMD",
                    "struct": null,
                    "source": 2860837171021627
                  }
                ],
                "source": 2860837171021627,
                "value_type": "string"
              },
              {
                "id": "GTIN",
                "name": "Código universal de producto",
                "value_id": null,
                "value_name": "719392169935",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Otros",
                "value_struct": null,
                "values": [
                  {
                    "id": null,
                    "name": "719392169935",
                    "struct": null,
                    "source": 3376461333454861
                  }
                ],
                "source": 3376461333454861,
                "value_type": "string"
              },
              {
                "id": "ITEM_CONDITION",
                "name": "Condición del ítem",
                "value_id": "2230284",
                "value_name": "Nuevo",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Otros",
                "value_struct": null,
                "values": [
                  {
                    "id": "2230284",
                    "name": "Nuevo",
                    "struct": null,
                    "source": 2860837171021627
                  }
                ],
                "source": 2860837171021627,
                "value_type": "list"
              },
              {
                "id": "MODEL",
                "name": "Modelo",
                "value_id": null,
                "value_name": "RYZEN 7 5700G",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Otros",
                "value_struct": null,
                "values": [
                  {
                    "id": null,
                    "name": "RYZEN 7 5700G",
                    "struct": null,
                    "source": 2860837171021627
                  }
                ],
                "source": 2860837171021627,
                "value_type": "string"
              },
              {
                "id": "PROCESSOR_BRAND",
                "name": "Marca del procesador",
                "value_id": "18034",
                "value_name": "AMD",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Otros",
                "value_struct": null,
                "values": [
                  {
                    "id": "18034",
                    "name": "AMD",
                    "struct": null,
                    "source": 7571550481372610
                  }
                ],
                "source": 7571550481372610,
                "value_type": "list"
              },
              {
                "id": "PROCESSOR_LINE",
                "name": "Línea del procesador",
                "value_id": "968657",
                "value_name": "Ryzen 7",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Otros",
                "value_struct": null,
                "values": [
                  {
                    "id": "968657",
                    "name": "Ryzen 7",
                    "struct": null,
                    "source": 7571550481372610
                  }
                ],
                "source": 7571550481372610,
                "value_type": "string"
              },
              {
                "id": "PROCESSOR_MODEL",
                "name": "Modelo del procesador",
                "value_id": "11087667",
                "value_name": "5700G",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Otros",
                "value_struct": null,
                "values": [
                  {
                    "id": "11087667",
                    "name": "5700G",
                    "struct": null,
                    "source": 7571550481372610
                  }
                ],
                "source": 7571550481372610,
                "value_type": "string"
              }
            ],
            "installments": {
              "quantity": 6,
              "amount": 138242.64,
              "rate": 12.95,
              "currency_id": "ARS",
              "metadata": {
                "meliplus_installments": false,
                "additional_bank_interest": false
              }
            },
            "winner_item_id": null,
            "catalog_listing": false,
            "discounts": null,
            "promotions": [],
            "inventory_id": null
          }
        ]
      }
    """ 
    static let emptyProductJSON = """
        {
        "site_id": "MLA",
        "country_default_time_zone": "GMT-03:00",
        "query": "pc gamer",
        "paging": {
          "total": 8627,
          "primary_results": 1000,
          "offset": 0,
          "limit": 50
        },
        "results": [
        ]
      }
    """    
}

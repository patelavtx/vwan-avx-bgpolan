# vwan-avx-bgpolan

# Apr 9 2024  (need to review if needed, but other repo works fine  AzTrGW-vwan)
Get following:

```
rror: Invalid index
│
│   on variables.tf line 34, in locals:
│   34:   split_data      = split("/", values(data.azurerm_virtual_network.example.vnet_peerings)[0])
│     ├────────────────
│     │ data.azurerm_virtual_network.example.vnet_peerings is empty map of string
│
│ The given key does not identify an element in this collection value: the collection has no elements.
```


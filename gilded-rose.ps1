

foreach ($item in $items) {
  if ($item.name -ne 'Aged Brie'
    -and $item.name -ne 'Backstage passes to a TAFKAL80ETC concert'
    -and $item.name -ne 'Sulfuras, Hand of Ragnaros'
    -and $item.quality -gt 0
  ) {
    $item.quality = $item.quality - 1
  } elseif ($item.quality -lt 50) {
    $item.quality = $item.quality + 1
    if ($item.name -eq 'Backstage passes to a TAFKAL80ETC concert') {
      if ($item.sellIn -lt 11 -and $item.quality -lt 50) {
        $item.quality = $item.quality + 1
      }
      if ($item.sellIn -lt 6 -and $item.quality -lt 50) {
        $item.quality = $item.quality + 1
      }
    }
  }
  if ($item.name -ne 'Sulfuras, Hand of Ragnaros') {
    $item.sellIn = $item.sellIn - 1
  }
  if ($item.sellIn -lt 0) {
    if ($item.name -ne 'Aged Brie') {
      if ($item.name -ne 'Backstage passes to a TAFKAL80ETC concert'
        -and $item.name -ne 'Sulfuras, Hand of Ragnaros'
        -and $item.quality -gt 0
      ) {
        $item.quality = $item.quality - 1
      } else {
        $item.quality = $item.quality - $item.quality
      }
    } elseif ($item.quality -lt 50) {
      $item.quality = $item.quality + 1
    }
  }
}

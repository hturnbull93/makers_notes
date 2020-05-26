# frozen_string_literal: true

recumbent_config = [
  ["chain", "9-speed"],
  ["tire_size", "28"],
  ['flag', 'tall and orange']
]

recumbent_bike = Bicycle.new(
  size: 'L',
  parts: PartsFactory.build(recumbent_config)
)

class TradeBaseModel {
  final String _price;
  final String _amount;

  // Not in the interface, since this is a constructor.
  TradeBaseModel(this._price, this._amount);
}
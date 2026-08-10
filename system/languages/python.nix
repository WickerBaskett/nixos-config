{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (python3.withPackages (python-pkgs: with python-pkgs; [
      pymongo
      pandas
      numpy
      matplotlib
      xgboost
      scikit-learn
    ]))
  ];
}

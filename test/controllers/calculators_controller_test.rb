require 'test_helper'

class CalculatorsControllerTest < ActionDispatch::IntegrationTest
  test "hitung dua tambah dua" do
    post calculators_path, params: { perhitungan: "dua tambah dua" }

    assert_equal "dua tambah dua adalah empat", assigns[:test_str]
  end

  test "hitung dua kurang satu" do
    post calculators_path, params: { perhitungan: "dua kurang satu" }

    assert_equal "dua kurang satu adalah satu", assigns[:test_str]
  end

  test "hitung tiga puluh empat tambah empat puluh delapan" do
    post calculators_path, params: { perhitungan: "tiga puluh empat tambah empat puluh delapan" }

    assert_equal "tiga puluh empat tambah empat puluh delapan adalah delapan puluh dua", assigns[:test_str]
  end

  test "hitung tujuh puluh dua kurang dua puluh" do
    post calculators_path, params: { perhitungan: "tujuh puluh dua kurang dua puluh" }

    assert_equal "tujuh puluh dua kurang dua puluh adalah lima puluh dua", assigns[:test_str]
  end

  test "hitung dua ratus empat puluh tujuh kurang lima belas" do
    post calculators_path, params: { perhitungan: "dua ratus empat puluh tujuh kurang lima belas" }

    assert_equal "dua ratus empat puluh tujuh kurang lima belas adalah dua ratus tiga puluh dua", assigns[:test_str]
  end

  test "hitung dua ratus empat puluh tujuh kurang lima belas" do
    post calculators_path, params: { perhitungan: "dua ratus empat puluh tujuh kurang lima belas" }

    assert_equal "dua ratus empat puluh tujuh kurang lima belas adalah dua ratus tiga puluh dua", assigns[:test_str]
  end

  test "hitung empat ratus empat puluh tujuh kurang lima belas" do
    post calculators_path, params: { perhitungan: "dua ratus empat puluh tujuh kurang lima belas" }

    assert_equal "dua ratus empat puluh tujuh kurang lima belas adalah dua ratus tiga puluh dua", assigns[:test_str]
  end
end

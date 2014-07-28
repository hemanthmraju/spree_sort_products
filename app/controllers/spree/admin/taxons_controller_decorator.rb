module Spree
  module Admin
    class TaxonsController < Spree::Admin::BaseController
      before_filter :load_taxon, :only => [:sort_products, :update_products,:sort_hand_count]

      def sort_products
        @products = @taxon.active_products
      end

      def update_products
        products = @taxon.products_taxons
        product_ids_positions = params[:product_positions].split(",").map(&:to_i)
        product_ids_positions.each_with_index do |id, index|
          product = products.detect{|p| p.product_id == id }
          product.update_attributes(:position => index) unless product.nil?
        end
        redirect_to sort_products_taxons_path(@taxonomy, @taxon.id), :notice => t(:sort_products_taxons_update_message)
      end

      def sort_hand_count
        products = @taxon.products_taxons
        product_ids_positions = @taxon.products.sort_by { |p| p[:count_on_hand]}.reverse.map(&:id)
        product_ids_positions.each_with_index do |id, index|
          product = products.detect{|p| p.product_id == id }
          product.update_attributes(:position => index) unless product.nil?
        end
        redirect_to sort_products_taxons_path(@taxonomy, @taxon.id), :notice => t(:sort_products_taxons_update_message)
      end

      def load_taxon
        @taxonomy = Taxonomy.find(params[:taxonomy_id])
        @taxon = Taxon.find(params[:id])
      end
    end
  end
end
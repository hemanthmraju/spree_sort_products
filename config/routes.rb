Spree::Core::Engine.routes.draw do
  # Add extension routes here

  match 'admin/taxonomies/:taxonomy_id/taxons/:id/sort_products/' => 'admin/taxons#sort_products', :as => :sort_products_taxons
  match 'admin/taxonomies/:taxonomy_id/taxons/:id/update_products/' => 'admin/taxons#update_products', :as => :update_products_admin_taxonomy_taxon, :method => :post
  match 'admin/taxonomies/:taxonomy_id/taxons/:id/sort_hand_count/' => 'admin/taxons#sort_hand_count', :as => :sort_hand_count_admin_taxonomy_taxon, :method => :post

end

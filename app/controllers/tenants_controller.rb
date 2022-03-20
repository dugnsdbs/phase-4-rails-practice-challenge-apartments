class TenantsController < ApplicationController

  def index 
    render json: Tenant.all
  end

  def show 
    tenant = Tenant.find(params[:id])
    render json: tenant, status: :accepted
  end

  def create 
    tenant = Tenant.create!(tenant_params)
    render json: tenant
  end

  def update
    tenant = Tenant.find(params[:id])
    tenant.update!(tenant_params)
    render json: tenant
  end

  def destroy 
    tenant = TenTenantent.find(params[:id])
    tenant.destroy
    head :no_content
  end

  private 

  def tenant_params
    params.permit(:name, :age)
  end


end

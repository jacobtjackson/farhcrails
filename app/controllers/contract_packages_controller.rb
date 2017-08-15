class ContractPackagesController < ApplicationController
  def new
    @contract_package = ContractPackage.new
  end

  def create
    @contract_package = ContractPackage.new(contract_package_params)
    if @contract_package.save
      flash[:notice] = "The contract was created successfully."
      redirect_to admin_index_path
    else
      flash[:notice] = "There was an issue creating the contract. Please try again."
      redirect_to new_contract_package_path
    end
  end

  private

  def contract_package_params
    params.require(:contract_package).permit(:file)
  end
end

module Api
    module V1
        class BiciUsuariosController < ApplicationController
            def index
                biciusers = BiciUsuario.order('created_at DESC')
                render json: {status: 'SUCCESS', message:'Usuarios Registrados', data:biciusers}, status: :ok
            end

            def show
                biciusers = BiciUsuario.find(params[:id])
                render json: {status: 'SUCCESS', message:'Usuarios Registrados', data:biciusers}, status: :ok
            end
            def create
                biciuser = BiciUsuario.new(biciUser_params)

                if biciuser.save
                    render json: {status: 'SUCCESS', message:'Usuario Guardado', data:biciuser}, status: :ok
                else
                    render json: {status: 'ERROR', message:'Usuario NO Guardado', data:biciuser.errors}, status: :ok
                end
            end

            def update
                biciusers = BiciUsuario.find(params[:id])
                if biciusers.update_attributes(biciUser_params)
                    render json: {status: 'SUCCESS', message:'Usuario Actualizado', data:biciusers}, status: :ok
                else
                    render json: {status: 'ERROR', message:'Usuario NO Actualizado', data:biciusers.errors}, status: :umprocessable_entity
                end
            end
            def destroy
                biciusers = BiciUsuario.find(params[:id])
                biciusers.destroy
                render json: {status: 'SUCCESS', message:'Ariculos Eliminado', data:biciusers}, status: :ok
            end

            def current
                render json: current_user
            end

            private
            def biciUser_params
                #raise params.inspect
                params.require(:user).permit(:username,:name,:document,:email,:password,:password_confirmation)
            end
                # Use callbacks to share common setup or constraints between actions.
            def set_user
                @user = BiciUsuario.find(params[:id])
            end
  
        end
    end
end
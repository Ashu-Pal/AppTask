//
//  PostVC.swift
//  AppTask2
//
//  Created by Ashu on 27/03/23.
//

import UIKit
enum checkSelect: Int{
    case userData = 0
    case album
    case commentOnPost
    case Album2
}
class PostVC: UIViewController {
    
    
    @IBOutlet weak var postsTableView: UITableView!
    var viewCheck = " "
    var postviewModels = PostViewModel()
    var usersviewmodel = UserViewModel()
    var albumViewModel = AlbumsViewModel()
    var todosViewModel = ToDosViewModel()
    var chekView: menu = .user

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        checkButton()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - initialize method
    private func initialize(){
        postsTableView.delegate = self
        postsTableView.dataSource = self
        
        postsTableView.register(UINib(nibName: "PostVCTableCell", bundle: nil), forCellReuseIdentifier: "PostVCTableCell")
        postsTableView.register(UINib(nibName: "UsersTableCell", bundle: nil), forCellReuseIdentifier: "UsersTableCell")
        postsTableView.register(UINib(nibName: "UsersPostsTableCell", bundle: nil), forCellReuseIdentifier: "UsersPostsTableCell")
        postsTableView.register(UINib(nibName: "ToDosTableCell", bundle: nil), forCellReuseIdentifier: "ToDosTableCell")
        //postsTableView.rowHeight = UITableView.automaticDimension
        postsTableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    //MARK: - check button
    func checkButton(){

        switch chekView{
        case .user:
            getUsersFromAPI()
        case .albums:
            getAlbumsFromAPI()
        case .posts:
            getPostsFromAPI()
        case .todos:
            getToDosFromAPI()
        
        }
    }
    // MARK: - API call
    func getPostsFromAPI(){
        Utility.showIndicator()
        postviewModels.getposts{[weak self] success, Error in
            guard let self = self else {return}
            if success{
                self.postsTableView.reloadData()
            }else{
                print("error!")
            }
            Utility.hideIndicator()
        }
    }
    // MARK: - call API for get users data
    func getUsersFromAPI(){
        Utility.showIndicator()
        usersviewmodel.getUsers{[weak self] success, Error in
            guard let self = self else {return}
            if success{
                self.postsTableView.reloadData()
            }else{
                print("error!")
            }
            Utility.hideIndicator()
        }
    }
    
    // MARK: - get albums data from API
    func getAlbumsFromAPI(){
        Utility.showIndicator()
        albumViewModel.getAlbumsData{[weak self] success, Error in
            guard let self = self else {return}
            if success{
                self.postsTableView.reloadData()
            }else{
                print("error!")
            }
            Utility.hideIndicator()
        }
    }
    
    // MARK: - get todos data from api
    func getToDosFromAPI(){
        Utility.showIndicator()
        todosViewModel.getToDos{[weak self] success, Error in
            guard let self = self else {return}
            if success{
                self.postsTableView.reloadData()
            }else{
                print("error!")
            }
            Utility.hideIndicator()
        }
    }
    
    // MARK: - back button
    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension PostVC: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch chekView{
        case .user:
            return usersviewmodel.UsersData.count
        case .albums:
            return albumViewModel.albumData.count
        case .posts:
            return postviewModels.postsData.count
        case .todos:
            return todosViewModel.toDosData.count
        
        }
    }
    // MARK: cell for ROw at function of the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch chekView{
        case .user:
            let cell = postsTableView.dequeueReusableCell(withIdentifier: "UsersTableCell" , for: indexPath) as! UsersTableCell
            cell.selectionStyle = .none
            cell.setUserdata(usersviewmodel.UsersData[indexPath.row])
            return cell
        case .albums:
            let cell = postsTableView.dequeueReusableCell(withIdentifier: "UsersPostsTableCell" , for: indexPath) as! UsersPostsTableCell
            cell.selectionStyle = .none
            cell.setAlbumData(albumViewModel.albumData[indexPath.row])
            return cell
        case .posts:
            let cell = postsTableView.dequeueReusableCell(withIdentifier: "PostVCTableCell" , for: indexPath) as! PostVCTableCell
            cell.selectionStyle = .none
            cell.setPostData(postviewModels.postsData[indexPath.row])
            return cell
        case .todos:
            let cell = postsTableView.dequeueReusableCell(withIdentifier: "ToDosTableCell" , for: indexPath) as! ToDosTableCell
            cell.selectionStyle = .none
            cell.setToDoData(todosViewModel.toDosData[indexPath.row])
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return   UITableView.automaticDimension
    }
    
    // MARK: - selection method of the table view
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch chekView{
        case .user:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: "UsersAlbum") as! UsersAlbum
            nextVC.postId = "\(usersviewmodel.UsersData[indexPath.row].id ?? 0)"
            //nextVC.checkDidSelect = .userData
            self.navigationController?.pushViewController(nextVC, animated: true)
        case .albums:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: "UsersVC") as! UsersVC
            nextVC.albumUserID = "\(albumViewModel.albumData[indexPath.row].id)"
            nextVC.checkDidSelect = .album
            self.navigationController?.pushViewController(nextVC, animated: true)
        default:
            if chekView == .posts{
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let nextVC = storyboard.instantiateViewController(withIdentifier: "CommentsOnPostsVC") as! CommentsOnPostsVC
                nextVC.commentpostId = "\(postviewModels.postsData[indexPath.row].userId)"
                nextVC.postCommentTitle = postviewModels.postsData[indexPath.row].title
                nextVC.postCommentDescription = postviewModels.postsData[indexPath.row].body
                nextVC.showHeader = true
                self.navigationController?.pushViewController(nextVC, animated: true)
            }
        }
    }
    
    
}

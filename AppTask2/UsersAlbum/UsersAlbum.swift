//
//  UsersAlbum.swift
//  AppTask2
//
//  Created by Ashu on 31/03/23.
//

import UIKit
enum checkAlbumOrPostsClicked: Int{
    case posts = 0
    case Album
}
class UsersAlbum: UIViewController {
    
    @IBOutlet weak var userDataTableView: UITableView!
    @IBOutlet weak var choiceSegmentControl: UISegmentedControl!
    
    var postIDViewModel = PostIDViewModel()
    var postId = ""
    var usersAlbumviewmodel = UsersAlbumViewModel()
    var checkDidSelect2: checkSelect = .commentOnPost
    //var usersAlbumID = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        postIDViewModel.ID = postId
        usersAlbumviewmodel.ID = Int(postId)!
        initialize()
        getpostsIdFromAPI()
        // Do any additional setup after loading the view.
    }
    // MARK: - initialize function
    func initialize(){
        userDataTableView.delegate = self
        userDataTableView.dataSource = self
        userDataTableView.estimatedRowHeight = UITableView.automaticDimension
        //callAPIs()
        registerNibFile()
    }
    // MARK: - back button Action
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - register table view cell function
    func registerNibFile(){
        userDataTableView.register(UINib(nibName: "UsersPostsTableCell", bundle: nil), forCellReuseIdentifier: "UsersPostsTableCell")
        userDataTableView.register(UINib(nibName: "UsersAlbumsTableViewCell", bundle: nil), forCellReuseIdentifier: "UsersAlbumsTableViewCell")
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    // MARK: - segment control action
    @IBAction func segmentControlAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            getpostsIdFromAPI()
            checkDidSelect2 = .commentOnPost
            sendSegmentControllerState()
            userDataTableView.reloadData()
            
        case 1:
            getUsersAlbumFromAPI()
            checkDidSelect2 = .Album2
            sendSegmentControllerState()
            userDataTableView.reloadData()
            
        default:
            break
        }
    }
    // MARK: - func to call ApI
    func callAPIs(){
        switch choiceSegmentControl.selectedSegmentIndex{
        case 0:
            getpostsIdFromAPI()
        case 1:
            getUsersAlbumFromAPI()
        default:
            break
        }
    }
    
    // MARK: - get usersposts data from API
    func getpostsIdFromAPI(){
        Utility.showIndicator()
        postIDViewModel.getpostsID{[weak self] success, Error in
            guard let self = self else {return}
            if success{
                self.userDataTableView.reloadData()
            }else{
                print("error!")
            }
            Utility.hideIndicator()
        }
    }
    // MARK: - get users albums from the API
    func getUsersAlbumFromAPI(){
        Utility.showIndicator()
        usersAlbumviewmodel.getUsersAlbumsData{[weak self] success, Error in
            guard let self = self else {return}
            if success{
                self.userDataTableView.reloadData()
            }else{
                print("error!")
            }
            Utility.hideIndicator()
        }
    }
    // MARK: -checking the nextVC
    func sendSegmentControllerState(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "CommentsOnPostsVC") as! CommentsOnPostsVC
        if checkDidSelect2 == .commentOnPost{
            nextVC.showHeader = true
        }
        
    }
    
}
extension UsersAlbum: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch choiceSegmentControl.selectedSegmentIndex{
        case 0:
             return postIDViewModel.postsData.count
        case 1:
            return usersAlbumviewmodel.usersalbumData.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch choiceSegmentControl.selectedSegmentIndex{
        case 0:
            let cell = userDataTableView.dequeueReusableCell(withIdentifier: "UsersPostsTableCell", for: indexPath) as! UsersPostsTableCell
            cell.selectionStyle = .none
            cell.setData(postIDViewModel.postsData[indexPath.row])
            return cell
        case 1:
            let cell = userDataTableView.dequeueReusableCell(withIdentifier: "UsersAlbumsTableViewCell", for: indexPath) as! UsersAlbumsTableViewCell
            cell.setUserAlbumData(usersAlbumviewmodel.usersalbumData[indexPath.row])
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let nextVC = storyboard.instantiateViewController(withIdentifier: "CommentsOnPostsVC") as! CommentsOnPostsVC
//        nextVC.postCommentTitle = postIDViewModel.postsData[indexPath.row].title
//        nextVC.postCommentDescription = postIDViewModel.postsData[indexPath.row].body
        if checkDidSelect2 == .commentOnPost{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: "CommentsOnPostsVC") as! CommentsOnPostsVC
            nextVC.postCommentTitle = postIDViewModel.postsData[indexPath.row].title
            nextVC.postCommentDescription = postIDViewModel.postsData[indexPath.row].body
            nextVC.showHeader = true
            nextVC.commentpostId = postId
            self.navigationController?.pushViewController(nextVC, animated: true)
        }else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: "UsersVC") as! UsersVC
            nextVC.checkDidSelect = .album
            nextVC.albumUserID = postId
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        
        //self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

